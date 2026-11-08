package game.scenes;

import core.Game;
import openfl.text.TextField;
import core.Scene;
import core.SceneManager;

class GameOverScene extends Scene {
    public function new() {
        super();
    }

    override public function create() {
        super.create();

        var gameOverText = new TextField();
        gameOverText.text = 'GAME OVER';

        gameOverText.x = 0;
        gameOverText.y = 0;

        graphics.beginFill(0x70C5CE);
        graphics.drawRect(0, 0, Game.GAME_WIDTH, Game.GAME_HEIGHT);
        graphics.endFill();

        addChild(gameOverText);
    }

    override public function update(delta:Float) {
        
    }
}