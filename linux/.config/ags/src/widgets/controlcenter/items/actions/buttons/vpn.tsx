import { bind, Variable } from 'astal';

import CustomVpn from '@services/vpn';

export const Vpn = () => {
  const vpn = CustomVpn.get_default();

  const connection = Variable.derive([bind(vpn, 'enabled'), bind(vpn, 'name')]);

  return (
    <box
      onDestroy={() => {
        connection.drop();
        vpn.drop();
      }}
    >
      {connection(([enabled, name]) => {
        const icon = enabled
          ? 'vpn-caps-symbolic'
          : 'vpn-caps-disabled-symbolic';
        return (
          <button className={`action ${enabled ? 'active' : ''}`}>
            <box>
              <icon className="icon" icon={icon} />
              <box vertical visible={false}>
                <label
                  className={`subtitle ${enabled ? 'active' : ''}`}
                  label={enabled ? name : 'Disabled'}
                />
              </box>
            </box>
          </button>
        );
      })}
    </box>
  );
};
