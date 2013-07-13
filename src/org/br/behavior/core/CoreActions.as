package org.br.behavior.core
{
	
	import org.br.behavior.actions.ActionGroup;
	import org.br.behavior.core.commands.CommandAddShell;
	import org.br.behavior.core.commands.CommandRemoveShell;
	
	/**
	 * The <code>CoreActions</code> class define the core actions
	 * @author mau
	 */
	public class CoreActions extends ActionGroup
	{
		
		CommandAddShell;
		CommandRemoveShell;		
		
		/**
		 *Class Contructor.
		 * @param <code>Array</code> with  commands.
		 * @param <code>Array</code> with names divide by "," char.
		 */
		public function CoreActions(commands:Array = null , names:String = null)
		{
			if(!commands){
				commands = [ "org.br.behavior.core.commands.CommandAddShell", "org.br.behavior.core.commands.CommandRemoveShell"];//new CommandAddShell() , new CommandRemoveShell() ];
			}
			
			if(!names){
				names = "addShell,removeShell";
			}
			
			super(commands , names);
		}
		
	}
}