package org.br.behavior.core.flex
{
	
	import mx.core.IMXMLObject;
	import org.br.behavior.core.Shell;
	
	/**
	 * The class <code>FlexShell</code> is flex version of the shell, utilizing <code>IMXMLObject#initialized()</code> method to auto initialize.
	 * @author mau
	 */
	public class FlexShell extends Shell implements IMXMLObject
	{
		/**
		 * Class Contructor 
		 */
		public function FlexShell()
		{
			super( null , null );
		}
		
		/**
		 * @inheritDoc
		 */
		public function initialized(document:Object, id:String):void
		{
			init( document , id );
		}
		
	}
}