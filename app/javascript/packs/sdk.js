import Cookies from 'js-cookie';
import { IFrameHelper } from '../sdk/IFrameHelper';
import { onBubbleClick } from '../sdk/bubbleHelpers';

const runSDK = ({ baseUrl, websiteToken }) => {
  const chatwootSettings = window.chatwootSettings || {};
  window.$chatwoot = {
    baseUrl,
    hasLoaded: false,
    hideMessageBubble: chatwootSettings.hideMessageBubble || false,
    isOpen: false,
    position: chatwootSettings.position || 'right',
    websiteToken,

    toggle() {
      onBubbleClick();
    },

    setUser(identifier, user) {
      if (typeof identifier === 'string' || typeof identifier === 'number') {
        window.$chatwoot.identifier = identifier;
        window.$chatwoot.user = user || {};
        IFrameHelper.sendMessage('set-user', {
          identifier,
          user: window.$chatwoot.user,
        });
      } else {
        throw new Error('Identifier should be a string or a number');
      }
    },

    setLabel(label = '') {
      IFrameHelper.sendMessage('set-label', { label });
    },

    removeLabel(label = '') {
      IFrameHelper.sendMessage('remove-label', { label });
    },

    reset() {
      if (window.$chatwoot.isOpen) {
        onBubbleClick();
      }

      Cookies.remove('cw_conversation');
      const iframe = IFrameHelper.getAppFrame();
      iframe.src = IFrameHelper.getUrl({
        baseUrl: window.$chatwoot.baseUrl,
        websiteToken: window.$chatwoot.websiteToken,
      });
    },
  };

  IFrameHelper.createFrame({
    baseUrl,
    websiteToken,
  });
};

window.chatwootSDK = {
  run: runSDK,
};
