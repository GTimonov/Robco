package controllers;

import openfl.events.EventDispatcher;
import openfl.events.IEventDispatcher;

/**
 * ...
 * @author George Timonov
 */
class PhysController extends EventDispatcher
{	
	public function new(level:Xml, target:IEventDispatcher=null) 
	{
		super(target);
		if (level)
			parceXML(level);
	}
	private function parceXML(level:Xml):Void
	{
		
	}
	
} 