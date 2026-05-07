import { bind } from 'astal';

import CPUService from '@services/cpu';

export const CPU = () => {
  const storage = CPUService.get_default();

  return (
    <box className="progress">
      {bind(storage, 'usage').as(({ percentage }) => (
        <circularprogress
          className="cpu"
          startAt={0}
          endAt={1}
          value={percentage}
        >
          <box vertical>
            <icon icon="processor-symbolic" />
            <label
              className="label"
              label={`${Math.floor(percentage * 100)}%`}
            />
          </box>
        </circularprogress>
      ))}
    </box>
  );
};
