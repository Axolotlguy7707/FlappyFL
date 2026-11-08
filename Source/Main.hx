package;

import game.scenes.PlayScene;
import core.Game;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();

		this.addChild(new Game(new PlayScene()));
	}
}
