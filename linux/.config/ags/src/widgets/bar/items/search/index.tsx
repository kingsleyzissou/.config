import { App } from 'astal/gtk3';

export const Search = () => {
  const onClick = () => {
    App.get_window('launcher')!.show();
  };

  return (
    <button className="button" onClick={onClick}>
      <icon className="icon search" icon="folder-saved-search-symbolic" />
    </button>
  );
};
