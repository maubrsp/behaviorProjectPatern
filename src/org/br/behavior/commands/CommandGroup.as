package org.br.behavior.commands
{
	import org.br.behavior.patterns.interfaces.ICommand;
	import org.br.behavior.patterns.interfaces.ICommandResult;
	
	/**
	 * The <code>CommandGroup</code> class is a base for create group of commands.
	 * @see org.br.behavior.commands.Command
	 * @author mau
	 */
	public class CommandGroup extends Command implements ICommandResult
	{
		
		/**
		 * The group of commands to execute indexed in a <code>Vector</code> of <code>ICommand</code> 
		 */
		public var group:Vector.<ICommand>
		
		/**
		 * Class Construdtor
		 * @param sequenceData <code>Vector</code> of <code>ICommand</code>
		 */
		public function CommandGroup(sequenceData:Vector.<ICommand>)
		{
			super();
			group = sequenceData;
		}
		
	}
}