package org.br.behavior.core.commands
{
	import org.br.behavior.commands.Command;
	import org.br.behavior.core.Core;
	import org.br.behavior.patterns.interfaces.IShell;
	
	/**
	 * The class <code>CommandAddShell</code> execute the add shell in core funcionality.
	 * @author mau
	 */
	public class CommandAddShell extends Command
	{
		
		/**
		 *Constructor 
		 */
		public function CommandAddShell()
		{
			super();
		}
		
		/**
		 * @inherit
		 */
		override public function execute(scope:Object):void{
			super.execute( scope );
			Core.getInstance().addShell( data as IShell );
			sucess();
		}
		
	}
}