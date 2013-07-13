package org.br.examples.testpatern
{
	import org.br.behavior.actions.ActionGroup;
	import org.br.examples.testpatern.commands.TestPaternCommand1;
	import org.br.examples.testpatern.commands.TestPaternCommand2;
	import org.br.examples.testpatern.commands.TestPaternCommand3;
	
	public class TestPaternActions extends ActionGroup
	{
		
		TestPaternCommand1;
		TestPaternCommand2;
		TestPaternCommand3;
		
		public function TestPaternActions( commands:Array = null, names:String = null )
		{
			
			if(!commands){
				commands = ['org.br.examples.testpatern.commands.TestPaternCommand1' , 'org.br.examples.testpatern.commands.TestPaternCommand2' , 'org.br.examples.testpatern.commands.TestPaternCommand3']
			}
			
			if(!names){
				names = "TestCommand1,TestCommand2,TestCommand3";
			}

			super(commands, names);
			
		}
		
	}
}