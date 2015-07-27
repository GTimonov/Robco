package;

import openfl.display.Sprite;
import openfl.events.Event;
import src.Game;
import src.MainMenu;

/**
 * ...
 * @author George Timonov
 */
class Main extends Sprite 
{
	
	private var mainStage:Game = new Game();
	private var mainMenu:MainMenu = new MainMenu();

	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, initialise);
		
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
	}
	private function initialise(event:Event):Void
	{
		trace("kokoko");
		addChild(mainStage);
	}
}
