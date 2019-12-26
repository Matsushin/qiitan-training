<template>
  <div class="image-viewer" ref="viewer">
    <slot></slot>
  </div>
</template>
<script>
  import Viewer from 'viewerjs'
  export default {
    props: {
      inline: {
        type: Boolean,
        default: false
      },
      button: {
        type: Boolean,
        default: false
      },
      navbar: {
        type: [Boolean, Number],
        default: 0
      },
      title: {
        type: [Boolean, Number, Function, Array],
        default: 0
      },
      tooltipShow: {
        type: Boolean,
        default: false
      },
      movable: {
        type: Boolean,
        default: true
      },
      zoomable: {
        type: Boolean,
        default: true
      },
      rotatable: {
        type: Boolean,
        default: true
      },
      scalable: {
        type: Boolean,
        default: true
      },
      transition: {
        type: Boolean,
        default: true
      },
      fullscreen: {
        type: Boolean,
        default: true
      },
      keyboard: {
        type: Boolean,
        default: true
      },
      backdrop:{
        type: [Boolean, String],
        default: true
      },
      loading: {
        type: Boolean,
        default: true
      },
      loop: {
        type: Boolean,
        default: true
      },
      interval: {
        type: Number,
        default: 5000
      },
      minWidth: {
        type: Number,
        default: 200
      },
      minHeight: {
        type: Number,
        default: 200
      },
      zoomRatio: {
        type: Number,
        default: 0.1
      },
      minZoomRatio: {
        type: Number,
        default: 0.35
      },
      maxZoomRatio: {
        type: Number,
        default: 1.5
      },
      zIndex: {
        type: Number,
        default: 9999
      },
      zIndexInline: {
        type: Number,
        default: 100
      }
    },
    created () {
      this.$nextTick(() => {
        this.viewerInit()
      })
    },
    methods: {
      viewerInit () {
        this.viewer = new Viewer(this.$refs.viewer, {
          initialViewIndex: this.index,
          inline: this.inline,
          button: this.button,
          navbar: this.navbar,
          title: this.title,
          toolbar: false,
          tooltip: this.tooltipShow,
          movable: this.movable,
          zoomable: this.zoomable,
          rotatable: this.rotatable,
          scalable: this.scalable,
          transition: this.transition,
          fullscreen: this.fullscreen,
          keyboard: this.keyboard,
          backdrop: this.backdrop,
          loading: this.loading,
          loop: this.loop,
          interval: this.interval,
          minWidth: this.minWidth,
          minHeight: this.minHeight,
          zoomRatio: this.zoomRatio,
          minZoomRatio: this.minZoomRatio,
          maxZoomRatio: this.maxZoomRatio,
          zIndex: this.zIndex,
          zIndexInline: this.zIndexInline,
          url: this.url,
          container: this.container,
          filter: this.filter,
          toggleOnDblclick: this.toggleOnDblclick,
          shown: () => {
            if(!document.getElementById('header')) {
              const el = document.getElementsByClassName('viewer-container')[0]
              const content = document.createElement('div');
              content.id = 'header'
              content.style.cssText = "position: absolute;\
                                       padding: 10px;\
                                       line-height: 1;\
                                       background-color: #fff;\
                                       font-size: 1.6rem;\
                                       text-align: right;\
                                       width: 100%;"
              const closeButton = document.createElement('div');
              closeButton.textContent = '×';
              closeButton.style.cssText = "display: inline-block;\
                                           padding-right: 10px;\
                                           color: #edb02d;\
                                           font-weight: bold;"
              closeButton.setAttribute('data-viewer-action', 'mix')
              content.appendChild(closeButton);
              const closeText = document.createElement('div');
              closeText.style.cssText = "display: inline-block;"
              content.appendChild(closeText);
              el.appendChild(content);
            }
          }
        })
      }
    }
  }
</script>