class RolesController < ApplicationController
  # GET /roles
  # GET /roles.xml
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roles }
    end
  end

  # GET /roles/1
  # GET /roles/1.xml
  def show
    @role = Role.find(params[:id])
    @people = @role.people_abstraction
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @role }
    end
  end

  # GET /roles/new
  # GET /roles/new.xml
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
    @people = @role.people_abstraction
  end

  # POST /roles
  # POST /roles.xml
  def create
    @role = Role.new(:name=>params[:role][:name]) 

    respond_to do |format|
      if @role.save and @role.update_attributes(params[:role])
        update_roles
        @role.save
        format.html { redirect_to(@role, :notice => 'Role was successfully created.') }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.xml
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        #Update all roles
        update_roles    
        @role.save
        format.html { redirect_to(@role, :notice => 'Role was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.xml
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to(roles_url) }
      format.xml  { head :ok }
    end
  end

private
  def update_roles
    @role.people_abstraction = []
    @role.festivals.each do |f|
      f.sections.each do |s|
        s.groups.each do |g|
          g.positions.each do |po|
            po.people.each do |p|
              unless p.nil?
                @role.people_abstraction << p
              end
            end
          end
        end
      end
    end
    @role.sections.each do |s|
      s.groups.each do |g|
        g.positions.each do |po|
          po.people.each do |p|
            unless p.nil?
              @role.people_abstraction << p
            end
          end
        end
      end
    end
    @role.groups.each do |g|
      g.positions.each do |po|
        po.people.each do |p|
          unless p.nil?
            @role.people_abstraction << p
          end
        end
      end
    end
    @role.people.each do |p|
      @role.people_abstraction << p
    end
  end
end
