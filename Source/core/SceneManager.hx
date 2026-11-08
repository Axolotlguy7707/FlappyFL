package core;

import core.Game;
import core.Scene;

class SceneManager {
    public function new() {
        
    }

    public function switchScene(scene: Scene) {
        if (Game.instance.currentScene != null) {
            Game.instance.removeChild(Game.instance.currentScene);
        }

        Game.instance.currentScene = scene;
        Game.instance.addChild(scene);
        Game.instance.currentScene.create();
    }
}