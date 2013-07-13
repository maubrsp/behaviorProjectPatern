package org.br.behavior.patterns.interfaces
{
	/**
	 * The <code>ICore</code> interface define rules to use in all Core im plementations.
	 * @author mau
	 */
	public interface ICore
	{
		/**
		 * GET/SET the logger controller usasge, if true is used else not.
		 * @return 
		 */
		function get useLoggers():Boolean;
		function set useLoggers(value:Boolean):void;
	}
}