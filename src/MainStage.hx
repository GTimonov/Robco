package src;


import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;
import nape.space.Space;
import nape.util.Debug;
import nape.util.BitmapDebug;

import openfl.display.Sprite;
import openfl.events.Event;
/**
 * ...
 * @author George Timonov
 */
class MainStage extends Sprite
{
	var space:Space;
	var body:Body;
	var debug:Debug;
	var gravity:Vec2;
	
	public function new() 
	{
		super();
		
		if (stage != null) 
		{
            initialise(null);
        }
        else 
		{
            addEventListener(Event.ADDED_TO_STAGE, initialise);
		}
		
	}
	private function enterFrameHandler(ev:Event):Void 
	{
		space.step(1 / stage.frameRate);
 
        debug.clear();
        debug.draw(space);
        debug.flush();
    }
	private function initialise(ev:Event):Void
	{
		if (ev != null) {
            removeEventListener(Event.ADDED_TO_STAGE, initialise);
        }
			
		
		gravity = Vec2.weak(0, 600);
		debug = new BitmapDebug(stage.stageWidth, stage.stageHeight, 0xddff44);
		addChild(debug.display);
		space = new Space(gravity);
		body = new Body(BodyType.DYNAMIC, new Vec2(50, 50));
		body.shapes.add(new Polygon(Polygon.rect(50, (stage.stageHeight - 50), (stage.stageWidth - 100), 1)));
		body.space = space;
		
		addEventListener(Event.ENTER_FRAME, enterFrameHandler);
	}
 
}