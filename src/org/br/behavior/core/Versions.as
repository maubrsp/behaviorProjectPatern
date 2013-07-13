package org.br.behavior.core
{
	import flash.utils.Dictionary;
	
	import org.br.behavior.patterns.interfaces.IVersion;

	/**
	 * The <code>Versions</code> class is the versions manager, use this manager to catch a shell.
	 * @author mau
	 */
	public class Versions
	{
		
		private var instances:Dictionary = new Dictionary(true);
		
		private static var instance:Versions;
		private static var allowInstantiation:Boolean;
		
		/**
		 * Class Conbstructor
		 */
		public function Versions(enforcer:SingletonEnforcer)
		{
		}
		
		/**
		 * GET the Singletone Versions Instance
		 * @return <code>Versions</code>
		 */
		public static function getInstance():Versions{
			if(!instance){ 
				allowInstantiation = true;
				instance = new Versions(new SingletonEnforcer());
				allowInstantiation = false;
			}
			return instance;
		}
		
		/**
		 * Add a <coce>IVersion</code> to this manager.
		 * @param id <coce>String</code>
		 * @param version <coce>IVersion</code>
		 * @return <coce>Boolean</code> with true if sucesses else false
		 */
		public function addVersion(id:String , version:IVersion):Boolean{
			if( !hasVersion(id) ){
				instances[id] = version;
				return true;
			}
			return false;
		}
		
		/**
		 * Remove a <coce>IVersion</code> from this manager.
		 * @param id <coce>String</code>
		 * @return <coce>Boolean</code> with true if sucesses else false
		 */
		public function removeVersion(id:String):Boolean{
			if(hasVersion(id)){
				instances[id] = null;
				delete instances[id]
				return true;
			}
			return false;
		}
		
		/**
		 * Verify if a version exist in this manager.
		 * @param id <coce>String</code>
		 * @return <coce>Boolean</code> with true if the requested version exist, else false.
		 */
		public function hasVersion(id:String):Boolean{
			return instances[id] != undefined ? true : false;
		}

	}
}
/**
 * Simple Class to enforcer the singletone.
 * @author mau
 */
class SingletonEnforcer { }