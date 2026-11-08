package game.scenes;

import core.Game;
import box2D.common.math.B2Vec2;
import game.objects.Pipe;
import openfl.events.Event;
import lime.ui.KeyCode;
import openfl.events.KeyboardEvent;
import game.objects.Bird;
import core.Scene;

class PlayScene extends Scene {

    var bird: Bird;

    var pipeTimer:Float = 0;

    var pipes:Array<Pipe> = [];

    var pipeSpeed:Float = 200;


    public function new() {
        super();
    }

    override public function create() {
        super.create();

        bird = new Bird();

        this.addChild(bird);

        graphics.beginFill(0x70C5CE);
        graphics.drawRect(0, 0, Game.GAME_WIDTH, Game.GAME_HEIGHT);
        graphics.endFill();

        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
    }

    override public function update(delta:Float) {
        super.update(delta);

        if (bird != null) {
            bird.update(delta);
        }

        pipeTimer += delta;

        if (pipeTimer >= 2) {
            pipeTimer = 0;
            spawnPipes();
        }

        for (pipe in pipes) {
            var pos = pipe.body.getPosition();

            pipe.body.setPosition(
                new B2Vec2(
                    pos.x - pipeSpeed * delta / pipe.PPM,
                    pos.y
                )
            );

            pipe.update(delta);
        }
    }

    function spawnPipes():Void {
        var gapY = 100 + Math.random() * 300;
        var gapSize = 150;

        var topPipe = new Pipe(
            800,
            gapY - 150 - gapSize / 2
        );

        var bottomPipe = new Pipe(
            800,
            gapY + 150 + gapSize / 2
        );

        addChild(topPipe);
        addChild(bottomPipe);

        pipes.push(topPipe);
        pipes.push(bottomPipe);
    }

    function onKeyDown(e:KeyboardEvent) {
        if (e.keyCode == KeyCode.SPACE) {
            bird.flap();
        }
    }
}