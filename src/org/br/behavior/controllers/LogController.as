package org.br.behavior.controllers
{
	import flash.utils.Dictionary;
	
	import org.br.behavior.core.Core;
	import org.br.behavior.patterns.interfaces.ILog;

	/**
	 * The <code>LogController<code/> class is a singletone to manage log, receiving calls, adding/remove loggers and use funcitonalities.
	 * @author mau
	 */
	public class LogController
	{
		
		/**
		 * @private
		 */
		private static var instance:LogController;
		
		/**
		 * @private
		 */
		private const loggers:Dictionary = new Dictionary(true);
		
		/**
		 * @private
		 */
		private const usages:String = "usages";
		
		/**
		 * Use to invoque all loggers.
		 */
		public static const LOG_ALL:String = "logAll";
		
		/**
		 * Class Constructor
		 */
		public function LogController(enforcer:SingletonEnforcer)
		{
			super();
		}
		
		/**
		 * GET this singletone instance.
		 * @return <code>LogController</code>
		 */
		public static function getInstance():LogController{
			if(!instance){
				instance = new LogController(new SingletonEnforcer());
			}
			return instance;
		}
		
		/**
		 * Add a logger in this manager to provide his functionalities.
		 * @param logger <code>ILog</code>
		 * @param loggerName <code>String</code>
		 * @param usage <code>String</code> with "," concaneted names of use.
		 */
		public function addLog(logger:ILog , loggerName:String , usage:String  ):Boolean{
			if(loggers[loggerName]){
				LogController.getInstance().log( Core.TRACER ,
												Core.TRACE_MESSAGE , 
												"The logger: " + loggerName + " already exist in controller, verify your code and instantiation process");
			}else{
				loggers[loggerName] = logger;
				loggers[loggerName+usages] = usage;
			}
			if(!(loggers[loggerName] == logger && loggers[loggerName+usages] == usage ))throw new Error("Error addinf logger: " + loggerName);
			return true; 
		}
		
		/**
		 * Remove a logger.
		 * @param loggerName <code>String</code>
		 */
		public function removeLog( loggerName:String ):Boolean{
			if(loggers[loggerName]){
				
				if(loggers[loggerName].hasOwnProperty("destroy")){
					(loggers[loggerName] as ILog).destroy();
				}
				
				loggers[loggerName] = null;
				delete loggers[loggerName];
				
				loggers[loggerName + usages] = null;
				delete loggers[loggerName + usages];
				
				return true
			}
			
			return false;
		}
		
		/**
		 * Add a usage to a logger.
		 * @param type <code>String</code>
		 * @param usage <code>String</code>
		 */
		public function addUsages( types:String , usage:String ):void{
			
				for (var logs:String in loggers ) 
				{
					//verify if logger receive usage - match in types for log, for all
					if( (types.search(logs) >= 0 || types == LOG_ALL ) ){
						
						for each (var stringUsage:String in usage.split( "," )) 
						{
							//verify if usage exist
							if( String(loggers[logs + usages]).split(",").indexOf(stringUsage) == -1 ){
								loggers[logs + usages] += String(loggers[logs + usages]).length > 1 ?  "," + stringUsage : stringUsage;
							}
						}
					}
						
				}
			
		}
		
		/**
		 * Remove usages from loggers.
		 * @param types <code>String</code>
		 * @param usage <code>String</code>
		 */
		public function removeUsages( types:String , usage:String):void{
			var newLogUsage:String="";
			for (var logs:String in loggers ) 
			{
				if( (types.search(logs) >= 0 || types == LOG_ALL ) ){
					newLogUsage = "";
					for each (var stringUsage:String in String(loggers[logs+usages]).split(",") ) 
					{
						if( usage.split(",").indexOf(stringUsage) == -1 ){
							newLogUsage += newLogUsage.length >1 ? "," + stringUsage : stringUsage;
						}
					}
					loggers[logs+usages] = newLogUsage;
				}
			}
			
		}
		
		
		/**
		 * Send a log message to logges with usages.
		 * @param type <code>String</code>
		 * @param message <code>String</code>
		 * @return <code>Boolean</code> with true if has logger to usage and log was sent.
		 */
		public function log( types:String , usage:String , message:String ):Boolean
		{
			var result:Boolean;
			for (var logs:String in loggers ) 
			{
				//verify if is Ilog, and math loggers
				if( ( loggers[logs] is ILog ) && ( types == LOG_ALL || types.split(",").indexOf(logs) > -1 ) ){
					for each (var stringUsage:String in String(loggers[logs + usages]).split(",")) 
					{
						//verify if usage exist
						if( usage.split(",").indexOf(stringUsage) > -1 ){
							(loggers[logs] as ILog).log(message);
							result = true
							break;
						}
						
					}
				}
				
			}
			return result;
		}
		
	}
}
/**
 * Simple Class to enforcer the singletone.
 * @author mau
 */
class SingletonEnforcer { }