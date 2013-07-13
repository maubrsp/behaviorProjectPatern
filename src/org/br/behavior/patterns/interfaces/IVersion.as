package org.br.behavior.patterns.interfaces
{
	
	/**
	 * The <code>IVersion</code> interface determine getters and setters to versions.
	 * @author mau
	 */
	public interface IVersion
	{
		
		/**
		 *Get/Set the <code>String</code> with <code>Core</code> version value.
		 * @return <code>String</code> with version value. 
		 */
		function get version():String;
		function set version(value:String):void;
		
		/**
		 * Get/Set <code>Boolean</code> with <b>true</b> if version is valid, if invalid <b>false</b>.
		 * @return <code>Boolean</code>.
		 */
		function get versionValidated():Boolean;
		function set versionValidated(value:Boolean):void;
		
		/**
		 * Get/Set <code>ICommand</code> with create version functionalities.
		 * @return 
		 */
		function get createCommand():ICommand;
		function set createCommand(value:ICommand):void;
		/**
		 * Get/Set <code>ICommand</code> with error on create version.
		 * @return 
		 */
		function get createErrorCommand():ICommand;
		function set createErrorCommand(value:ICommand):void;
		
		/**
		 * Get/Set <code>ICommand</code> with version validation functionalities.
		 * @return 
		 */
		function get validateVersionCommand():ICommand;
		function set validateVersionCommand(value:ICommand):void;
		/**
		 * Get/Set <code>ICommand</code> with error on version validation.
		 * @return 
		 */
		function get validateVersionErrorCommand():ICommand;
		function set validateVersionErrorCommand(value:ICommand):void;
		
	}
}