package;

import openfl.display.Sprite;
import openfl.events.Event;
import views.Game;
import views.MainMenuView;

/**
 * ...
 * @author George Timonov
 */
class Main extends Sprite 
{
	
	private var mainStage:Game = new Game();
	private var mainMenu:MainMenuView = new MainMenuView();

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
