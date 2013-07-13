package org.br.behavior.patterns.interfaces
{
	
	/**
	 * The <code>ILog</code> interface define logger implementation
	 * @author mau
	 */
	public interface ILog extends IDestroyable
	{
		/**
		 * Execute the log action;
		 * @param message <code>String</code>
		 */
		function log( message:String ):void;
	}
}