package org.br.examples.teste1
{
	import org.br.behavior.actions.ActionGroup;
	import org.br.examples.teste1.commands.TestCommand1;
	import org.br.examples.teste1.commands.TestCommand2;
	
	public class Test1Actions extends ActionGroup
	{
		public function Test1Actions(commands:Array = null, names:String = null)
		{
			if(!commands){
				commands = [new TestCommand1(), new TestCommand2()]
			}
			
			if(!names){
				names = "Test1 ,Test2 ";
			}
			super(commands, names);
		}
	}
}