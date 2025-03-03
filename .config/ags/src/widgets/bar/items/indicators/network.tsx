import { bind } from 'astal';

import NetworkService from 'gi://AstalNetwork';

export const Network = () => {
  const network = NetworkService.get_default();
  const wifi = bind(network, 'wifi');
  const wired = bind(network, 'wired');

  if (wired.as(Boolean)) {
    {
      wired.as((wired) => (
        <box>
          <icon className="icon wifi" icon={bind(wired, 'iconName')} />
          <label
            className="label"
            label={bind(wired, 'speed').as((speed) => `${speed}`)}
          />
        </box>
      ));
    }
  }

  return (
    <>
      {wifi.as((wifi) => {
        return (
          <button className="button">
            <box>
              <icon className="icon wifi" icon={bind(wifi, 'iconName')} />
              <label
                className="label"
                label={bind(wifi, 'strength').as((strength) => `${strength}%`)}
              />
            </box>
          </button>
        );
      })}
    </>
  );
};
