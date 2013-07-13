package org.br.behavior.commands
{
	import org.br.behavior.patterns.interfaces.ICommand;
	import org.br.behavior.patterns.interfaces.ICommandResult;

	/**The <code>CommandSequence</code> class process multiples commands in sequence;
	 * @author mau
	 */
	public class CommandSequence extends CommandGroup
	{
		
		/**
		 *@private 
		 */
		private var currentCommand:int = -1;
		/**
		 *@private 
		 */
		private var ignoreErrors:Boolean;
		
		/**
		 * Class Constructor 
		 * @param sequenceData <code>Vector</code> with index order of command to control execution.
		 * @param ignoreError <code>Boolean</code> if true its ignore an error in a command an co9ntinues with the sequense, case false stop the sequence;
		 * 
		 */
		public function CommandSequence( sequenceData:Vector.<ICommand> , ignoreError:Boolean = true )
		{
			super(sequenceData);
			ignoreErrors = ignoreError;
		}
		
		/**
		 * @inheritDoc
		 */
		public override function execute(scope:Object):void{
			super.execute(scope);
			executeSequence(null);
		}
		
		/**
		 * @private
		 */
		private function executeSequence(data:Object):void{
			
			if(currentCommand >= group.length - 1){
				caller.sucess(data);
				return;
			}
			
			if(currentCommand >= 0) group[currentCommand] = null;
			
			currentCommand++;
			
			group[currentCommand].execute(this);
			
		}
		
		/**
		 * @inheritDoc
		 */
		override public function sucess(data:Object = null):void{
			executeSequence(data);
		}

		/**
		 * @inheritDoc
		 */
		override public function error(data:Object = null):void{
			if(ignoreErrors){
				executeSequence(data);
			}else{
				caller.error(data);
			}
		}
			
		/**
		 * @inheritDoc
		 */
		override public function destroy():void{
			group = null;
			super.destroy();
			null;
		}
		
	}
}