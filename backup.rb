require "etc"


class Backup
  def initialize(name)
    @name = name

    setup
  end

  def setup
    "setting up some stuff"
  end

  def perform_normal!
    system("echo 'normal'")

    "starting backup of #{@name}"
  end

  def perform_forked!
    execute_as :nobody do
      system("echo 'forked'")
    end

    "starting backup of #{@name}"
  end


  def execute_as(theuser, &block)
    user = theuser.to_s
    uid, gid = Process.euid, Process.egid

    target_uid = Etc.getpwnam(user).uid
    target_gid = Etc.getpwnam(user).gid

    Kernel.fork do
      Process.initgroups(user, target_gid)
      Process::GID.change_privilege(target_gid)
      Process::UID.change_privilege(target_uid)

      block.call
    end

    Process.wait
  end

end
