package org.br.behavior.commands
{
	import org.br.behavior.patterns.interfaces.ICommandResult;

	/**
	 * The <code>CommandValidadeErrorDefault</code> class define rules when error on avalidate a version.
	 * @see org.br.behavior.core.Version
	 * @author mau
	 */
	public class CommandValidadeErrorDefault extends Command
	{
		/**
		 * Class Constructor
		 */
		public function CommandValidadeErrorDefault()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function execute(scope:Object):void{
			super.execute(scope);
			trace("error executing version validation in " , scope);
			sucess();
		}
		
	}
}