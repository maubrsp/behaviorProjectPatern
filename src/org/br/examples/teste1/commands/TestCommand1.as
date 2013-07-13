package org.br.examples.teste1.commands
{
	import org.br.behavior.commands.Command;
	import org.br.behavior.patterns.interfaces.ICommandResult;
	
	public class TestCommand1 extends Command
	{
		public function TestCommand1()
		{
			super();
		}
		
		override public function execute(scope:Object):void{
			super.execute(scope);
			
			trace("start TestCommand1 - " , this , scope );
			
		}
		
		
	}
}