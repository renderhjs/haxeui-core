package haxe.ui.util;

import haxe.ui.core.Component;
import haxe.ui.events.UIEvent;

class EventMap  {
    private var _map:Map<String, FunctionArray<UIEvent->Void>>;

    public function new() {
        _map = new Map<String, FunctionArray<UIEvent->Void>>();
    }

    public function keys():Iterator<String> {
        return _map.keys();
    }
    
    public function add(type:String, listener:UIEvent->Void, priority:Int = 0):Bool { // returns true if a new FunctionArray was created
        var b:Bool = false;
        var arr:FunctionArray<UIEvent->Void> = _map.get(type);
        if (arr == null) {
            arr = new FunctionArray<UIEvent->Void>();
            arr.push(listener, priority);
            _map.set(type, arr);
            b = true;
        } else if (arr.contains(listener) == false) {
            arr.push(listener, priority);
        }
        return b;
    }

    public function remove(type:String, listener:UIEvent->Void):Bool { // returns true if a FunctionArray was removed
        var b:Bool = false;
        var arr:FunctionArray<UIEvent->Void> = _map.get(type);
        if (arr != null) {
            arr.remove(listener);
            if (arr.length == 0) {
                _map.remove(type);
                b = true;
            }
        }
        return b;
    }

    public function contains(type:String, listener:UIEvent->Void=null):Bool {
        var b:Bool = false;
        var arr:FunctionArray<UIEvent->Void> = _map.get(type);
        if (arr != null) {
            b = (listener != null) ? arr.contains(listener) : true;
        }
        return b;
    }
    
    public function invoke(type:String, event:UIEvent, target:Component = null) {
        if (event.bubble && event.target == null) { 
            event.target = target; 
        } 
        
        var arr:FunctionArray<UIEvent->Void> = _map.get(type);
        if (arr != null) {
            arr = arr.copy();
            for (listener in arr) {
                if (event.canceled) { 
                    break; 
                } 
                
                var c = event.clone();
                if (c.target == null) {
                    c.target = target; 
                }
                listener.callback(c);
                event.canceled = c.canceled; 
            }
        }
    }

    public function listenerCount(type:String):Int {
        var n:Int = 0;
        var arr:FunctionArray<UIEvent->Void> = _map.get(type);
        if (arr != null) {
            n = arr.length;
        }
        return n;
    }
    
    public function listeners(type:String):FunctionArray<UIEvent->Void> {
        var arr:FunctionArray<UIEvent->Void> = _map.get(type);
        if (arr == null) {
            return null;
        }
        return arr;
    }
}