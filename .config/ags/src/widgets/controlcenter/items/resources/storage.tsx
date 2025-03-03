import { bind } from 'astal';

import StorageService from '@services/storage';

export const Storage = () => {
  const storage = StorageService.get_default();

  return (
    <box className="progress">
      {bind(storage, 'usage').as(({ percentage }) => (
        <circularprogress
          className="storage"
          startAt={0}
          endAt={1}
          value={percentage}
        >
          <box vertical>
            <icon icon="drive-harddisk-symbolic" />
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
