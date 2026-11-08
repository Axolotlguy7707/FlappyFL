package game.scenes;

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

        addChild(gameOverText);
    }
}