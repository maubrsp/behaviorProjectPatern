package org.br.behavior.models
{
	import org.br.behavior.patterns.interfaces.IModel;
	
	/**
	 * 
	 * @author dna
	 * 
	 */
	public class Model implements IModel
	{
		public function Model()
		{
		}
		
		public function dispose():void
		{
			throw new Error("Method dispose in: " + this + " required. Don't use super in overrides." );
		}
		
	}
}