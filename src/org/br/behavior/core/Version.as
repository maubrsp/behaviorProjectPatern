package org.br.behavior.core
{
	import org.br.behavior.patterns.interfaces.IActionGroup;
	import org.br.behavior.patterns.interfaces.ICommand;
	import org.br.behavior.patterns.interfaces.ICommandResult;
	import org.br.behavior.patterns.interfaces.IVersion;

	/**
	 * The <code>VersionBase</code> class is the base for create all shells, beans, micro and macro parts.
	 * @author mau
	 */
	public class Version implements ICommandResult, IVersion
	{
	
		/**
		 *@private 
		 */
		private var _versionValidated:Boolean;

		/**
		 * GETTER and SETTER to cath a <code>Boolean</code> if version was validated.
		 * @return <code>Boolean</code>
		 */
		public function get versionValidated():Boolean
		{
			return _versionValidated;
		}
		public function set versionValidated(value:Boolean):void
		{
			_versionValidated = value;
		}

		/**
		 * @private
		 */
		private var _version:String;
		/**
		 *Get/Set the <code>String</code> with version value.
		 * @return <code>String</code> with version value. 
		 */
		public function get version():String
		{
			return _version;
		}
		public function set version(value:String):void
		{
			_version = value;
		}
		
		/**
		 *@private 
		 */
		private var _createCommand:ICommand;
		/**
		 * Get/Set the <code>ICommand</code> to execute version creation.
		 * @return <code>ICommand</code>
		 */
		public function get createCommand():ICommand
		{
			return _createCommand;
		}
		
		public function set createCommand(value:ICommand):void
		{
			_createCommand = value;
		}
		
		private var _createErrorCommand:ICommand;
		/**
		 * Get / Set the the <code>ICommand</code> to execute in creation error.
		 * @return <code>ICommand</code>
		 */
		public function get createErrorCommand():ICommand
		{
			return _createErrorCommand;
		}
		public function set createErrorCommand(value:ICommand):void
		{
			_createErrorCommand = value;
		}
		
		/**
		 *@private 
		 */
		private var _validateVersionCommand:ICommand;
		/**
		 *Get/Set the <code>ICommand</code> to execute version validation; 
		 * @return <code>ICommand</code>
		 */
		public function get validateVersionCommand():ICommand
		{
			return _validateVersionCommand;
		}
		public function set validateVersionCommand(value:ICommand):void
		{
			_validateVersionCommand= value;
		}
		
		private var _validateVersionErrorCommand:ICommand;
		/**
		 * Get/Set the <code>ICommand</code> to execute in version validation error.
		 * @return 
		 */
		public function get validateVersionErrorCommand():ICommand
		{
			return _validateVersionErrorCommand;
		}
		public function set validateVersionErrorCommand(value:ICommand):void
		{
			_validateVersionErrorCommand = value;
		}

		private var _escope:Object;
		/**
		 *Get/Set the <code>Object</code> with the initialized default scope;
		 * @return <code>Object</code>
		 */
		public function get escope():Object
		{
			return _escope;
		}

		public function set escope(value:Object):void
		{
			_escope = value;
		}
		
		private var _shellId:String;

		/**
		 *Get/Set the <code>DisplayObject</code> with the initialized default scope;
		 * @return 
		 */
		public function get shellId():String
		{
			return _shellId;
		}

		public function set shellId(value:String):void
		{
			_shellId = value;
		}
		private var _actions:IActionGroup;

		/**
		 *Get/Set the <code>IActionGroup</code> with actions.
		 * @see <code>ActionGroup</code>.
		 * @return <code>ActionGroup</code>. 
		 */
		public function get actions():IActionGroup
		{
			return _actions;
		}
		public function set actions(value:IActionGroup):void
		{
			_actions = value;
		}

	
		/**
		 * Class Constructor
		 */
		public function Version()
		{
		}
		
		/**
		 * 
		 * @param document <code>Object</code>
		 * @param id <code>String</code>
		 */
		public function init(document:Object, id:String):void
		{
			shellId = id;
			escope = document;
			
			if(!_version)throw new Error( String("version needs declaration on " + document + " id: " + id) );
			if(!_createCommand)throw new Error( String("createCommand needs declaration on " + document + " id: " + id) );
			if(!_createErrorCommand)throw new Error( String("createErrorCommand needs declaration on " + document + " id: " + id) );
			if(!_validateVersionCommand)throw new Error( String("versionCommand needs declaration on " + document + " id: " + id) );
			_validateVersionCommand.onSucess = onValidateSucess;
			_validateVersionCommand.onError = onValidateError;
			_validateVersionCommand.execute(this);
		}
		
		/**
		 * Method to catch errors from version and create commands.
		 */
		public function error(data:Object = null):void
		{
			if(validateVersionCommand){
			}else{
				createCommand.destroy();
				createErrorCommand.execute(this);
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function sucess(data:Object = null):void
		{
			
		}
		
		/**
		 * @private
		 */
		private function onValidateSucess():void{
			
			validateVersionCommand.destroy();
			validateVersionCommand = null;
			Versions.getInstance().addVersion(version , this );
			
			createCommand.onSucess = onCreateSucess;
			createCommand.onError = onCreateError;
			createCommand.execute(this);
			
		}
		
		/**
		 * @private
		 */
		private function onCreateSucess():void{
			
			createCommand.destroy();
			createCommand = null;
			sucess();
			
		}
		
		/**
		 * @private
		 */
		private function onValidateError():void{
			
			validateVersionErrorCommand.execute(this);
			
		}
		
		/**
		 * @private
		 */
		private function onCreateError():void{
			
			createErrorCommand.execute(this);
			
		}
		
		/**
		 * @inheritDoc
		 */
		public function toString():String{
			return "Version.as - :" + version;
		}
		
	}
}