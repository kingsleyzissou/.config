import { bind } from 'astal';

import TailscaleService from '@services/tailscale';

export const Tailscale = () => {
  const tailscale = TailscaleService.get_default();

  return (
    <box onDestroy={() => tailscale.drop()}>
      {bind(tailscale, 'enabled').as((enabled) => {
        return (
          <button
            className={`action ${enabled ? 'active' : ''}`}
            onClick={() => {
              tailscale.toggle();
            }}
          >
            <box>
              <icon className="icon" icon="tailscale" />
            </box>
          </button>
        );
      })}
    </box>
  );
};
