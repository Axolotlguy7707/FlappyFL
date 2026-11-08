package game.objects;

import core.Game;
import box2D.dynamics.B2Body;
import box2D.collision.shapes.B2CircleShape;
import openfl.display.Sprite;
import core.physics.PhysicsSprite;
import box2D.dynamics.B2BodyDef;

class Bird extends PhysicsSprite {
    public function new() {
        super();

        graphics.beginFill(0xFFFF00);
        graphics.drawCircle(0, 0, 15);
        graphics.endFill();

        var bodyDef = new B2BodyDef();
        bodyDef.type = B2Body.b2_dynamicBody;
        bodyDef.position.set(5, 5);

        body = Game.instance.physicsWorld.createBody(bodyDef);

        var shape = new B2CircleShape(0.5);
        body.createFixture2(shape, 1);
    }

    override public function update(delta:Float) {
        super.update(delta);
    }
}