package org.br.behavior.patterns.interfaces
{
	public interface IViewController
	{
		
		/**
		 * 
		 * @return 
		 * 
		 */
		function get rootScope():Object;
		function set rootScope(displayObject:Object):void;
		
		/**
		 * 
		 * @param view
		 */
		function show(view:Object):void;
		
	}
}