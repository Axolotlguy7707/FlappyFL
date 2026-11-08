package core.physics;

import game.scenes.PlayScene;
import box2D.dynamics.B2ContactListener;
import box2D.dynamics.contacts.B2Contact;

class ContactListener extends B2ContactListener {

    override public function beginContact(contact:B2Contact):Void {
        var a = contact.getFixtureA().getBody().getUserData();
        var b = contact.getFixtureB().getBody().getUserData();

        if ((a == "bird" && b == "pipe") || (a == "pipe" && b == "bird")) {
            PlayScene.instance.bird.isDead = true;
        }
    }

}