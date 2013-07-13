package org.br.behavior.core.flex
{
	import mx.core.IMXMLObject;
	
	import org.br.behavior.core.Core;
	import org.br.behavior.patterns.interfaces.ICommand;
	import org.br.behavior.patterns.interfaces.IVersion;
	
	/**
	 * The <code>FlexCore</code> is a flex adapter to use this behavior pattern
	 * @author mau
	 */
	public class FlexCore implements IMXMLObject, IVersion
	{
		
		private var _useLoggers:Boolean;
		/**
		 * @inheritDoc
		 */
		public function get useLoggers():Boolean
		{
			return _useLoggers;
		}
		public function set useLoggers(value:Boolean):void
		{
			_useLoggers = value;
		}
		
		/**
		 *@private 
		 */
		private var _versionValidated:Boolean;
		
		/**
		 * 
		 */
		public function get versionValidated():Boolean
		{
			return _versionValidated;
		}
		
		/**
		 * @private
		 */
		public function set versionValidated(value:Boolean):void
		{
			_versionValidated = value;
		}
		
		private var _version:String;
		/**
		 * @inheritDoc
		 */
		public function get version():String
		{
			return _version;
		}
		
		public function set version(value:String):void
		{
			_version = value;
		}
		
		
		private var _createErrorCommand:ICommand;
		/**
		 * @inheritDoc 
		 */
		public function get createErrorCommand():ICommand
		{
			return _createErrorCommand;
		}
		
		public function set createErrorCommand(value:ICommand):void
		{
			_createErrorCommand = value;
		}
		
		
		private var _validateVersionCommand:ICommand;
		/**
		 * @inheritDoc 
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
		 * @inheritDoc 
		 */
		public function get validateVersionErrorCommand():ICommand
		{
			return _validateVersionErrorCommand;
		}
		
		public function set validateVersionErrorCommand(value:ICommand):void
		{
			_validateVersionErrorCommand = value;
		}
		
		
		private var _createCommand:ICommand;
		
		/**
		 * @inheritDoc 
		 */
		public function get createCommand():ICommand
		{
			return _createCommand;
		}
		
		public function set createCommand(value:ICommand):void
		{
			_createCommand = value;
		}
		
		/**
		 * Class Constructor
		 * 
		 */
		public function FlexCore()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		public function initialized(document:Object, id:String):void
		{
			Core.getInstance().version = version;
			
			Core.getInstance().createCommand = createCommand;
			Core.getInstance().createErrorCommand = createErrorCommand;
			
			Core.getInstance().validateVersionCommand = validateVersionCommand;
			Core.getInstance().validateVersionErrorCommand = validateVersionErrorCommand;
			
			Core.getInstance().useLoggers = useLoggers;
			
			Core.getInstance().init(document , id);
		}
		
	}
}