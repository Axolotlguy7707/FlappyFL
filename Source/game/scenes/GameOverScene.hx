package game.scenes;

import openfl.text.TextFormat;
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

        gameOverText.width = 500;
        gameOverText.height = 100;

        gameOverText.x = Game.GAME_WIDTH / 2 - 100;
        gameOverText.y = Game.GAME_HEIGHT / 2 - 50;

        var gameOverTextFormat = new TextFormat();
        gameOverTextFormat.size = 32;

        gameOverText.defaultTextFormat = gameOverTextFormat;
        gameOverText.text = 'GAME OVER';

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