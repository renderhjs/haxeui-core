package haxe.ui.styles;

import haxe.ui.core.Platform;
import haxe.ui.styles.animation.Animation.AnimationOptions;
import haxe.ui.styles.elements.Directive;
import haxe.ui.filters.Filter;
import haxe.ui.filters.FilterParser;

class Style {
    public var left:Null<Float>;
    public var top:Null<Float>;
    
    public var autoWidth:Null<Bool>;
    public var width:Null<Float>;
    public var percentWidth:Null<Float>;
    public var initialWidth:Null<Float>;
    public var initialPercentWidth:Null<Float>;
    public var minWidth:Null<Float>;
    public var maxWidth:Null<Float>;
    
    public var autoHeight:Null<Bool>;
    public var height:Null<Float>;
    public var percentHeight:Null<Float>;
    public var initialHeight:Null<Float>;
    public var initialPercentHeight:Null<Float>;
    public var minHeight:Null<Float>;
    public var maxHeight:Null<Float>;
    
    public var paddingTop:Null<Float>;
    public var paddingLeft:Null<Float>;
    public var paddingRight:Null<Float>;
    public var paddingBottom:Null<Float>;

    public var marginTop:Null<Float>;
    public var marginLeft:Null<Float>;
    public var marginRight:Null<Float>;
    public var marginBottom:Null<Float>;

    public var horizontalSpacing:Null<Float>;
    public var verticalSpacing:Null<Float>;
    
    public var color:Null<Int>;
    
    public var backgroundColor:Null<Int>;
    public var backgroundColorEnd:Null<Int>;
    public var backgroundGradientStyle:Null<String>;
    public var backgroundOpacity:Null<Float>;
    
    public var backgroundImage:Null<String>;
    public var backgroundImageRepeat:Null<String>;

    public var backgroundImageClipTop:Null<Float>;
    public var backgroundImageClipLeft:Null<Float>;
    public var backgroundImageClipBottom:Null<Float>;
    public var backgroundImageClipRight:Null<Float>;

    public var backgroundImageSliceTop:Null<Float>;
    public var backgroundImageSliceLeft:Null<Float>;
    public var backgroundImageSliceBottom:Null<Float>;
    public var backgroundImageSliceRight:Null<Float>;
    
    public var borderColor:Null<Int>;
    public var borderTopColor:Null<Int>;
    public var borderLeftColor:Null<Int>;
    public var borderBottomColor:Null<Int>;
    public var borderRightColor:Null<Int>;
    public var borderSize:Null<Float>;
    public var borderTopSize:Null<Float>;
    public var borderLeftSize:Null<Float>;
    public var borderBottomSize:Null<Float>;
    public var borderRightSize:Null<Float>;
    public var borderRadius:Null<Float>;
    public var borderOpacity:Null<Float>;
    
    public var icon:Null<String>;
    public var iconPosition:Null<String>;
    
    public var horizontalAlign:Null<String>;
    public var verticalAlign:Null<String>;
    public var textAlign:Null<String>;
    
    public var opacity:Null<Float>;
    public var clip:Null<Bool>;
    public var native:Null<Bool>;

    public var fontName:Null<String>;
    public var fontSize:Null<Float>;
    public var fontBold:Null<Bool>;
    public var fontUnderline:Null<Bool>;
    public var fontItalic:Null<Bool>;
    
    public var cursor:Null<String>;
    public var hidden:Null<Bool>;
    
    public var filter:Array<Filter>;
    
    public var resource:String;
    
    public var animationName:Null<String>;
    public var animationOptions:AnimationOptions;
    
    public var mode:String;
    
    public function new() {
    }
    
    public function mergeDirectives(map:Map<String, Directive>) {
        for (key in map.keys()) {
            var v = map.get(key);
            
            switch (key) {
                case "left":
                    left = ValueTools.calcDimension(v.value);
                case "top":
                    top = ValueTools.calcDimension(v.value);
                    
                case "width":
                    autoWidth = ValueTools.constant(v.value, "auto");
                    width = ValueTools.calcDimension(v.value);
                    percentWidth = ValueTools.percent(v.value);
                case "initial-width":
                    initialWidth = ValueTools.calcDimension(v.value);
                    initialPercentWidth = ValueTools.percent(v.value);
                case "min-width":
                    minWidth = ValueTools.calcDimension(v.value);
                case "max-width":
                    maxWidth = ValueTools.calcDimension(v.value);
                    
                case "height":
                    autoHeight = ValueTools.constant(v.value, "auto");
                    height = ValueTools.calcDimension(v.value);
                    percentHeight = ValueTools.percent(v.value);
                case "initial-height":
                    initialHeight = ValueTools.calcDimension(v.value);
                    initialPercentHeight = ValueTools.calcDimension(v.value);
                case "min-height":
                    minHeight = ValueTools.calcDimension(v.value);
                case "max-height":
                    maxHeight = ValueTools.calcDimension(v.value);
                    
                case "padding-top":
                    paddingTop = ValueTools.calcDimension(v.value);
                case "padding-left":
                    paddingLeft = ValueTools.calcDimension(v.value);
                case "padding-right":
                    paddingRight = ValueTools.calcDimension(v.value);
                case "padding-bottom":
                    paddingBottom = ValueTools.calcDimension(v.value);

                case "margin-top":
                    marginTop = ValueTools.calcDimension(v.value);
                case "margin-left":
                    marginLeft = ValueTools.calcDimension(v.value);
                case "margin-right":
                    marginRight = ValueTools.calcDimension(v.value);
                case "margin-bottom":
                    marginBottom = ValueTools.calcDimension(v.value);

                case "horizontal-spacing":
                    horizontalSpacing = ValueTools.calcDimension(v.value);
                case "vertical-spacing":
                    verticalSpacing = ValueTools.calcDimension(v.value);
                    
                case "color":
                    color = ValueTools.int(v.value);
                    
                case "background-color":
                    switch (v.value) {
                        case Value.VCall(f, vl):
                            if (f == "platform-color") {
                                backgroundColor = Platform.instance.getColor(ValueTools.string(vl[0]));
                            }
                        default:    
                            backgroundColor = ValueTools.int(v.value);
                            if (map.exists("background-color-end")) {
                                backgroundColorEnd = ValueTools.int(map.get("background-color-end").value);
                            } else {
                                backgroundColorEnd = null;
                            }
                    }
                case "background-color-end":
                    backgroundColorEnd = ValueTools.int(v.value);
                case "background-gradient-style":
                    backgroundGradientStyle = ValueTools.string(v.value);
                case "background-opacity":
                    backgroundOpacity = ValueTools.float(v.value);

                case "background-image":
                    backgroundImage = ValueTools.string(v.value);
                case "background-image-repeat":
                    backgroundImageRepeat = ValueTools.string(v.value);
                    
                case "background-image-clip-top":
                    backgroundImageClipTop = ValueTools.calcDimension(v.value);
                case "background-image-clip-left":
                    backgroundImageClipLeft = ValueTools.calcDimension(v.value);
                case "background-image-clip-right":
                    backgroundImageClipRight = ValueTools.calcDimension(v.value);
                case "background-image-clip-bottom":
                    backgroundImageClipBottom = ValueTools.calcDimension(v.value);
                    
                case "background-image-slice-top":
                    backgroundImageSliceTop = ValueTools.calcDimension(v.value);
                case "background-image-slice-left":
                    backgroundImageSliceLeft = ValueTools.calcDimension(v.value);
                case "background-image-slice-right":
                    backgroundImageSliceRight = ValueTools.calcDimension(v.value);
                case "background-image-slice-bottom":
                    backgroundImageSliceBottom = ValueTools.calcDimension(v.value);
                    
                case "border-color":
                    borderColor = ValueTools.int(v.value);
                case "border-top-color":
                    borderTopColor = ValueTools.int(v.value);
                case "border-left-color":
                    borderLeftColor = ValueTools.int(v.value);
                case "border-right-color":
                    borderRightColor = ValueTools.int(v.value);
                case "border-bottom-color":
                    borderBottomColor = ValueTools.int(v.value);
                    
                case "border-top-size" | "border-top-width":
                    borderTopSize = ValueTools.calcDimension(v.value);
                case "border-left-size" | "border-left-width":
                    borderLeftSize = ValueTools.calcDimension(v.value);
                case "border-right-size" | "border-right-width":
                    borderRightSize = ValueTools.calcDimension(v.value);
                case "border-bottom-size" | "border-bottom-width":
                    borderBottomSize = ValueTools.calcDimension(v.value);
                    
                case "border-radius":
                    borderRadius = ValueTools.calcDimension(v.value);
                case "border-opacity":
                    borderOpacity = ValueTools.float(v.value);
                    
                case "icon":
                    switch (v.value) {
                        case Value.VNone:
                            icon = null;
                        case _:
                            icon = ValueTools.string(v.value);
                    }
                case "icon-position":
                    iconPosition = ValueTools.string(v.value);
                    
                case "horizontal-align":
                    horizontalAlign = ValueTools.string(v.value);
                case "vertical-align":
                    verticalAlign = ValueTools.string(v.value);
                case "text-align":
                    textAlign = ValueTools.string(v.value);
                    
                case "opacity":
                    opacity = ValueTools.float(v.value);
                    
                case "font-name":
                    fontName = ValueTools.string(v.value);
                case "font-size":
                    fontSize = ValueTools.calcDimension(v.value);
                case "font-bold":
                    fontBold = ValueTools.bool(v.value);
                case "font-underline":
                    fontUnderline = ValueTools.bool(v.value);
                case "font-italic":
                    fontItalic = ValueTools.bool(v.value);
                    
                case "cursor":
                    cursor = ValueTools.string(v.value);
                case "hidden":
                    hidden = ValueTools.bool(v.value);
                    
                case "clip":
                    clip = ValueTools.bool(v.value);
                case "native":
                    native = ValueTools.bool(v.value);
                    
                case "filter":
                    switch (v.value) {
                        case Value.VCall(f, vl):
                            var arr = ValueTools.array(vl);
                            arr.insert(0, f);
                            filter = [FilterParser.parseFilter(arr)];
                        case Value.VConstant(f):
                            filter = [FilterParser.parseFilter([f])];
                        case Value.VNone:
                            filter = null;
                        case _:
                    }
                    
                case "resource":
                    resource = ValueTools.string(v.value);
                case "animation-name":
                    animationName = ValueTools.string(v.value);
                case "animation-duration":
                    createAnimationOptions();
                    animationOptions.duration = ValueTools.time(v.value);
                case "animation-timing-function":
                    createAnimationOptions();
                    animationOptions.easingFunction = ValueTools.calcEasing(v.value);
                case "animation-delay":
                    createAnimationOptions();
                    animationOptions.delay = ValueTools.time(v.value);
                case "animation-iteration-count":
                    createAnimationOptions();
                    animationOptions.iterationCount = switch (v.value) {
                        case Value.VConstant(val):
                            (val == "infinite") ? -1 : 0;
                        case _:
                            ValueTools.int(v.value);
                    };
                case "animation-direction":
                    createAnimationOptions();
                    animationOptions.direction = ValueTools.string(v.value);
                case "animation-fill-mode":
                    createAnimationOptions();
                    animationOptions.fillMode = ValueTools.string(v.value);
                case "mode":
                    mode = ValueTools.string(v.value);
            }
        }
    }

    public function apply(s:Style) {
        if (s.cursor != null) cursor = s.cursor;
        if (s.hidden != null) hidden = s.hidden;

        if (s.left != null) left = s.left;
        if (s.top != null) top = s.top;
        
        if (s.autoWidth != null) autoWidth = s.autoWidth;
        if (s.autoHeight != null) autoHeight = s.autoHeight;
        if (s.verticalSpacing != null) verticalSpacing = s.verticalSpacing;
        if (s.horizontalSpacing != null) horizontalSpacing = s.horizontalSpacing;

        if (s.width != null) {
            width = s.width;
            autoWidth = false;
        }
        if (s.initialWidth != null) initialWidth = s.initialWidth;
        if (s.initialPercentWidth != null) initialPercentWidth = s.initialPercentWidth;
        if (s.minWidth != null) minWidth = s.minWidth;
        if (s.maxWidth != null) maxWidth = s.maxWidth;
        
        if (s.height != null) {
            height = s.height;
            autoHeight = false;
        }
        if (s.initialHeight != null) initialHeight = s.initialHeight;
        if (s.initialPercentHeight != null) initialPercentHeight = s.initialPercentHeight;
        if (s.minHeight != null) minHeight = s.minHeight;
        if (s.maxHeight != null) maxHeight = s.maxHeight;
        
        if (s.percentWidth != null) {
            percentWidth = s.percentWidth;
            autoWidth = false;
        }
        if (s.percentHeight != null) {
            percentHeight = s.percentHeight;
            autoHeight = false;
        }

        if (s.paddingTop != null) paddingTop = s.paddingTop;
        if (s.paddingLeft != null) paddingLeft = s.paddingLeft;
        if (s.paddingRight != null) paddingRight = s.paddingRight;
        if (s.paddingBottom != null) paddingBottom = s.paddingBottom;

        if (s.marginTop != null) marginTop = s.marginTop;
        if (s.marginLeft != null) marginLeft = s.marginLeft;
        if (s.marginRight != null) marginRight = s.marginRight;
        if (s.marginBottom != null) marginBottom = s.marginBottom;

        if (s.color != null) color = s.color;

        if (s.backgroundColor != null) {
            backgroundColor = s.backgroundColor;
            backgroundColorEnd = null;
        }
        if (s.backgroundColorEnd != null) backgroundColorEnd = s.backgroundColorEnd;
        if (s.backgroundGradientStyle != null) backgroundGradientStyle = s.backgroundGradientStyle;
        if (s.backgroundOpacity != null) backgroundOpacity = s.backgroundOpacity;

        if (s.backgroundImage != null) backgroundImage = s.backgroundImage;
        if (s.backgroundImageRepeat != null) backgroundImageRepeat = s.backgroundImageRepeat;

        if (s.backgroundImageClipTop != null) backgroundImageClipTop = s.backgroundImageClipTop;
        if (s.backgroundImageClipLeft != null) backgroundImageClipLeft = s.backgroundImageClipLeft;
        if (s.backgroundImageClipBottom != null) backgroundImageClipBottom = s.backgroundImageClipBottom;
        if (s.backgroundImageClipRight != null) backgroundImageClipRight = s.backgroundImageClipRight;

        if (s.backgroundImageSliceTop != null) backgroundImageSliceTop = s.backgroundImageSliceTop;
        if (s.backgroundImageSliceLeft != null) backgroundImageSliceLeft = s.backgroundImageSliceLeft;
        if (s.backgroundImageSliceBottom != null) backgroundImageSliceBottom = s.backgroundImageSliceBottom;
        if (s.backgroundImageSliceRight != null) backgroundImageSliceRight = s.backgroundImageSliceRight;

        if (s.borderColor != null) borderColor = s.borderColor;
        if (s.borderTopColor != null) borderTopColor = s.borderTopColor;
        if (s.borderLeftColor != null) borderLeftColor = s.borderLeftColor;
        if (s.borderBottomColor != null) borderBottomColor = s.borderBottomColor;
        if (s.borderRightColor != null) borderRightColor = s.borderRightColor;

        if (s.borderSize != null) borderSize = s.borderSize;
        if (s.borderTopSize != null) borderTopSize = s.borderTopSize;
        if (s.borderLeftSize != null) borderLeftSize = s.borderLeftSize;
        if (s.borderBottomSize != null) borderBottomSize = s.borderBottomSize;
        if (s.borderRightSize != null) borderRightSize = s.borderRightSize;

        if (s.borderRadius != null) borderRadius = s.borderRadius;
        if (s.borderOpacity != null) borderOpacity = s.borderOpacity;

        if (s.filter != null) filter = s.filter.copy();
        if (s.resource != null) resource = s.resource;

        if (s.icon != null) icon = s.icon;
        if (s.iconPosition != null) iconPosition = s.iconPosition;

        if (s.horizontalAlign != null) horizontalAlign = s.horizontalAlign;
        if (s.verticalAlign != null) verticalAlign = s.verticalAlign;
        if (s.textAlign != null) textAlign = s.textAlign;

        if (s.opacity != null) opacity = s.opacity;

        if (s.clip != null) clip = s.clip;
        if (s.native != null) native = s.native;

        if (s.fontName != null) fontName = s.fontName;
        if (s.fontSize != null) fontSize = s.fontSize;
        if (s.fontBold != null) fontBold = s.fontBold;
        if (s.fontUnderline != null) fontUnderline = s.fontUnderline;
        if (s.fontItalic != null) fontItalic = s.fontItalic;

        if (s.animationName != null) animationName = s.animationName;
        if (s.animationOptions != null) {
            createAnimationOptions();
            if(s.animationOptions.duration != null) animationOptions.duration = s.animationOptions.duration;
            if(s.animationOptions.delay != null) animationOptions.delay = s.animationOptions.delay;
            if(s.animationOptions.iterationCount != null) animationOptions.iterationCount = s.animationOptions.iterationCount;
            if(s.animationOptions.easingFunction != null) animationOptions.easingFunction = s.animationOptions.easingFunction;
            if(s.animationOptions.direction != null) animationOptions.direction = s.animationOptions.direction;
            if(s.animationOptions.fillMode != null) animationOptions.fillMode = s.animationOptions.fillMode;
        }
        
        if (s.mode != null) mode = s.mode;
    }

    public function equalTo(s:Style):Bool {
        if (s.cursor != cursor) return false;
        if (s.hidden != hidden) return false;

        if (s.left != left) return false;
        if (s.top != top) return false;
        
        
        if (s.autoWidth != autoWidth) return false;
        if (s.autoHeight != autoHeight) return false;
        if (s.verticalSpacing != verticalSpacing) return false;
        if (s.horizontalSpacing != horizontalSpacing) return false;

        if (s.width != width) return false;
        if (s.initialWidth != initialWidth) return false;
        if (s.initialPercentWidth != initialPercentWidth) return false;
        if (s.minWidth != minWidth) return false;
        if (s.maxWidth != maxWidth) return false;
        
        if (s.height != height) return false;
        if (s.initialHeight != initialHeight) return false;
        if (s.initialPercentHeight != initialPercentHeight) return false;
        if (s.minHeight != minHeight) return false;
        if (s.maxHeight != maxHeight) return false;
        
        if (s.percentWidth != percentWidth) return false;
        if (s.percentHeight != percentHeight) return false;

        if (s.paddingTop != paddingTop) return false;
        if (s.paddingLeft != paddingLeft) return false;
        if (s.paddingRight != paddingRight) return false;
        if (s.paddingBottom != paddingBottom) return false;

        if (s.marginTop != marginTop) return false;
        if (s.marginLeft != marginLeft) return false;
        if (s.marginRight != marginRight) return false;
        if (s.marginBottom != marginBottom) return false;

        if (s.color != color) return false;

        if (s.backgroundColor != backgroundColor) return false;
        if (s.backgroundColorEnd != backgroundColorEnd) return false;
        if (s.backgroundGradientStyle != backgroundGradientStyle) return false;
        if (s.backgroundOpacity != backgroundOpacity) return false;

        if (s.backgroundImage != backgroundImage) return false;
        if (s.backgroundImageRepeat != backgroundImageRepeat) return false;

        if (s.backgroundImageClipTop != backgroundImageClipTop) return false;
        if (s.backgroundImageClipLeft != backgroundImageClipLeft) return false;
        if (s.backgroundImageClipBottom != backgroundImageClipBottom) return false;
        if (s.backgroundImageClipRight != backgroundImageClipRight) return false;

        if (s.backgroundImageSliceTop != backgroundImageSliceTop) return false;
        if (s.backgroundImageSliceLeft != backgroundImageSliceLeft) return false;
        if (s.backgroundImageSliceBottom != backgroundImageSliceBottom) return false;
        if (s.backgroundImageSliceRight != backgroundImageSliceRight) return false;

        if (s.borderColor != borderColor) return false;
        if (s.borderTopColor != borderTopColor) return false;
        if (s.borderLeftColor != borderLeftColor) return false;
        if (s.borderBottomColor != borderBottomColor) return false;
        if (s.borderRightColor != borderRightColor) return false;

        if (s.borderSize != borderSize) return false;
        if (s.borderTopSize != borderTopSize) return false;
        if (s.borderLeftSize != borderLeftSize) return false;
        if (s.borderBottomSize != borderBottomSize) return false;
        if (s.borderRightSize != borderRightSize) return false;

        if (s.borderRadius != borderRadius) return false;
        if (s.borderOpacity != borderOpacity) return false;

        if (s.filter != filter) return false;
        if (s.resource != resource) return false;

        if (s.icon != icon) return false;
        if (s.iconPosition != iconPosition) return false;

        if (s.horizontalAlign != horizontalAlign) return false;
        if (s.verticalAlign != verticalAlign) return false;
        if (s.textAlign != textAlign) return false;

        if (s.opacity != opacity) return false;

        if (s.clip != clip) return false;
        if (s.native != native) return false;

        if (s.fontName != fontName) return false;
        if (s.fontSize != fontSize) return false;
        if (s.fontBold != fontBold) return false;
        if (s.fontUnderline != fontUnderline) return false;
        if (s.fontItalic != fontItalic) return false;

        if (s.resource != resource) return false;
        if (s.animationName != animationName) return false;
        if (animationOptions != null && animationOptions.compareTo(s.animationOptions) == false) return false;
        
        if (s.mode != mode) return false;
        return true;
    }

    private inline function createAnimationOptions() {
        if (animationOptions == null) animationOptions = {};
    }
}