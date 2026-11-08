package game.scenes;

import openfl.events.Event;
import openfl.ui.Keyboard;
import openfl.text.TextField;
import lime.ui.KeyCode;
import openfl.events.KeyboardEvent;
import core.Scene;
import core.SceneManager;
import core.Game;

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

        // Background
        graphics.beginFill(0x70C5CE);
        graphics.drawRect(0, 0, Game.GAME_WIDTH, Game.GAME_HEIGHT);
        graphics.endFill();

        addChild(gameOverText);

        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
    }

    function onKeyDown(e:KeyboardEvent) {
        if (e.keyCode == Keyboard.SPACE) {
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        }

        SceneManager.switchScene(new PlayScene());
    }

    override public function update(delta:Float) {
        super.update(delta);
    }
}