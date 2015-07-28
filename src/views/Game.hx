package views;


import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;
import nape.space.Space;
import nape.util.Debug;
import nape.util.ShapeDebug;

import openfl.display.Sprite;
import openfl.events.Event;
/**
 * ...
 * @author George Timonov
 */
class Game extends Sprite
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
			
		
		gravity = Vec2.weak(0, 50);
		debug = new ShapeDebug(stage.stageWidth, stage.stageHeight, 0xddff44);
		
		cast(debug, ShapeDebug).thickness = 1;
		addChild(debug.display);
		
		space = new Space(gravity);
		body = new Body(BodyType.DYNAMIC, new Vec2(100, 100));
		body.shapes.add(new Polygon(Polygon.rect(-50,-50, 100, 100)));
		body.space = space;
		
		var staticBody = new Body(BodyType.STATIC, new Vec2(0, 0));
		staticBody.shapes.add(new Polygon(Polygon.rect(0, (stage.stageHeight - 50), (stage.stageWidth), 50)));
		staticBody.space = space;
		
		addEventListener(Event.ENTER_FRAME, enterFrameHandler);
	}
 
}