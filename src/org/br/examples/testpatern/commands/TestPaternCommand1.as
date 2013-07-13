package org.br.examples.testpatern.commands
{
	import org.br.behavior.commands.Command;
	import org.br.behavior.patterns.interfaces.ICommandResult;
	
	public class TestPaternCommand1 extends Command
	{
		public function TestPaternCommand1()
		{
			super();
		}
		
		override public function execute(scope:Object):void{
			super.execute(scope);
			
			trace("executando commando 1");
			
			sucess()
		}
		
	}
}