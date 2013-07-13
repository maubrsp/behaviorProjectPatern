package org.br.behavior.commands
{
	import flash.utils.setTimeout;
	
	import org.br.behavior.patterns.interfaces.ICommandResult;

	/**
	 * The <code>CommandValidateVersionDefault</code> class is necessary to validade a version in this case without functionality
	 * @author mau
	 */
	public class CommandValidateVersionDefault extends Command
	{
		
		/**
		 * Class Constructor 
		 */
		public function CommandValidateVersionDefault()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function execute(scope:Object):void{
			super.execute(scope);
			sucess();
		}
		
	}
}