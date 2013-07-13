package org.br.log
{
	import org.br.behavior.patterns.interfaces.ILog;
	
	/**
	 * The <code>LogThrowError</code> class is a logger to use throw error exceptions.
	 * @author mau
	 */
	public class LogThrowError implements ILog
	{
		/**
		 * Class Constructor.
		 */
		public function LogThrowError()
		{
		}
		
		/**
		 * @inheritDoc.
		 */
		public function log( message:String ):void
		{
			throw new Error(message);
		}
		
		/**
		 * @inheritDoc
		 */
		public function destroy():void
		{
			null;
		}
	}
}