import { bind } from 'astal';

import GithubService from '@services/github';

export const Github = () => {
  const github = GithubService.get_default();

  return (
    <>
      {bind(github, 'notifications').as((notifications) => {
        if (notifications === 0) {
          return <></>;
        }
        return (
          <button className="button" onDestroy={() => github.drop()}>
            <box>
              <icon className="icon github" icon="git-symbolic" />
              <label className="label" label={notifications.toString()} />
            </box>
          </button>
        );
      })}
    </>
  );
};
