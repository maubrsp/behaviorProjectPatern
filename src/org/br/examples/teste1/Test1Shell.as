package org.br.examples.teste1
{
	import org.br.behavior.patterns.interfaces.IActionGroup;
	import org.br.behavior.patterns.interfaces.IModel;
	import org.br.behavior.core.Shell;
	
	public class Test1Shell extends Shell
	{
		
		
		
		public function Test1Shell(actions:IActionGroup = null, data:IModel = null)
		{
			if(!actions){
				actions = new Test1Actions();
			}
			super(actions, data);
		}
		
		
		
	}
}