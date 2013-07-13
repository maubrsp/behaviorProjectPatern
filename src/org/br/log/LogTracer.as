package org.br.log
{
	import org.br.behavior.patterns.interfaces.ILog;
	/**
	 * The class <code>LogTracer</code> is a logger using trace
	 * @author mau
	 */
	public class LogTracer implements ILog
	{
		/**
		 * Class Constructor 
		 */
		public function LogTracer()
		{
		}
		
		/**
		 * @inheritDoc
		 */
		public function log(message:String):void
		{
			trace(message);
		}
		
		/**
		 * @inheritDoc
		 */
		public function destroy():void
		{
			null;
		}
	}
}