package game.objects;

import box2D.common.math.B2Vec2;
import core.Game;
import box2D.dynamics.B2Body;
import box2D.collision.shapes.B2CircleShape;
import openfl.display.Sprite;
import core.physics.PhysicsSprite;
import box2D.dynamics.B2BodyDef;

class Bird extends PhysicsSprite {

    public var isDead:Bool;

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

        isDead = false;
    }

    override public function update(delta:Float) {
        super.update(delta);

        if (body.getLinearVelocity().x != 0) {
            trace("moving horizontally");
            isDead = true;
        }
    }

    public function flap() {
        if (!isDead) {
            body.setLinearVelocity(new B2Vec2(body.getLinearVelocity().x, -5));
        }
    }
}