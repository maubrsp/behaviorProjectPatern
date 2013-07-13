package org.br.behavior.patterns.interfaces
{
	/**
	 * The <code>IDestroyable</code> is a <code>interfaces</code> to determine destroy functionality.
	 * @author mau
	 */
	public interface IDestroyable
	{
		/**
		 * This method remove the class and all your content from memory.
		 */
		function destroy():void;
	}
}