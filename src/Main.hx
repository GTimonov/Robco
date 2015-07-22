package;

import openfl.display.Sprite;
import openfl.Lib;
import src.MainStage;

/**
 * ...
 * @author George Timonov
 */
class Main extends Sprite 
{
	
	private var mainStage:MainStage = new MainStage();

	public function new() 
	{
		super();
		trace("kokoko");
		addChild(mainStage);
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
	}

}
