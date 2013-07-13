package org.br.behavior.controllers
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 * The <code>Broadcaster</code> class is a singletone patern wtih event dispatcher to centralize handle events to core.
	 * @author mau
	 */
	public class Broadcaster extends EventDispatcher
	{
		
		private static var instance:Broadcaster;
		/**
		 * Class Constructor
		 * @param target
		 */
		public function Broadcaster(enforcer:SingletonEnforcer,target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		 * Method to return the <code>Broadcasxter</code> singletone.
		 * @return <code>Broadcasxter</code>
		 */
		public static function getInstance():Broadcaster{
			if(!instance){ 
				instance = new Broadcaster(new SingletonEnforcer());
			}
			return instance;
		}
	}
}
/**
 * Simple Class to enforcer the singletone.
 * @author mau
 */
class SingletonEnforcer { }