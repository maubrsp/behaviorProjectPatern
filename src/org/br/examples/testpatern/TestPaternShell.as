package org.br.examples.testpatern
{
	import org.br.behavior.patterns.interfaces.IActionGroup;
	import org.br.behavior.patterns.interfaces.IModel;
	import org.br.behavior.core.Shell;
	
	public class TestPaternShell extends Shell
	{
		public function TestPaternShell( actions:IActionGroup = null , data:IModel = null )
		{
			if(!actions){
				actions = new TestPaternActions()
			}
			
			if(!data){
				data = new TestModel();
			}
			
			super(actions, data);
		}
		
		
		
	}
}